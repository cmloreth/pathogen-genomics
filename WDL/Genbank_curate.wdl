version 1.0

task Genbank_curate {

    input {
        String  Google_Maps_API_Key
    }

    command {
        python3 ~/scripts/genbank_curate.py ~{Google_Maps_API_Key}
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

