version 1.0

workflow genbank_curate {
    input {
        File  Google_Maps_API_Key_File
    }
    call pull_data {
        input:
            Google_Maps_API_Key_File = Google_Maps_API_Key_File
    }
    output {
        File    seqs_fasta = pull_data.genbank_seqs_fasta
        File    seqs_metadata = pull_data.genbank_seqs_metadata
    }
}


task pull_data {

    input {
        String  Google_Maps_API_Key_File
    }

    command {
        python3 ~/scripts/genbank_curate.py ~{Google_Maps_API_Key_File}
    }

  output {
    File                genbank_seqs_fasta = 'genbank_seqs.fasta'
    File                genbank_seqs_metadata = 'genbank_seq_metadata.tsv'
}

  runtime {
    docker: "cmloreth/pathogen-genomics:test"
    memory: "1 GB"
    cpu: 1
    disks: "local-disk 100 HDD"
    dx_instance_type: "mem1_ssd1_v2_x2"
  }
}

