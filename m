From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2012 22:26:03 +0100
Subject: [Buildroot] opencv with glibc
In-Reply-To: <CAPeX=+vQJu2j2+auOTr8+q18hNa7q_ZD848Hj7B+DPGSJ8RDxQ@mail.gmail.com>
References: <CAPeX=+tCiegGOeD2bi9+v8aOVrB=FjHo3XEAvp1b5tNfR85N-w@mail.gmail.com>
 <CAPeX=+ubBEJeR9s+gH8ACDpUToXLA_rDqDwL4NT44BZ-PsfFsA@mail.gmail.com>
 <CAHXCMMKLFopuH8ubCnaY2_1oKkXf-wXHmzV_Fvo77NAutCKOcw@mail.gmail.com>
 <CAPeX=+s407S8aNwEZnKD4UAzJjR15-+juPYrJdXR+T4sEg6wEQ@mail.gmail.com>
 <CAHXCMM+_TrnpuCA6C_8MbVkd1gyZLBmJ3kihufb-5snLguUs_A@mail.gmail.com>
 <CAPeX=+vQJu2j2+auOTr8+q18hNa7q_ZD848Hj7B+DPGSJ8RDxQ@mail.gmail.com>
Message-ID: <20120215222603.6754b8e6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 15 Feb 2012 21:35:25 +0200,
Ozgun <ozgun.gunay@gmail.com> a ?crit :

> My br doesn't have output/toolchainfile.cmake file

Which version of Buildroot are you using? Are you doing out-of-tree
build (if so, then the toolchainfile.cmake file is in the output
directory you selected with O=, not in output/).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
