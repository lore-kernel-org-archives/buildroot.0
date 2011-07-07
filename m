From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Thu, 7 Jul 2011 16:30:11 -0400
Subject: [Buildroot] how buildroot handles sysroot in cross tool chain
Message-ID: <CAAa76NRtMHbgOH=j9yNr4wUxMpd_2RR5UHFpfvy8V306BenbJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I have a question in my head for a while: When we build cross tool
chains, there always is a sysroot path hide in the compiler. The
problem is, this path is a absolutely path. So, if we move the tool
chain to other locations, the sysroot path will be broken. How could I
distribute my tool chain to other developer's work station if I they
can only access their HOME directory? Since they have different user
name, their home directory will has different path. I do not want
every one spend a long time to build the tool chain. Is it even
possible?

thanks,
raymond
