From: a <anushka.parashar@tesco.com>
Date: Tue, 12 Nov 2019 13:02:53 -0600 (CST)
Subject: [Buildroot] Adding linux commands to my package's make file
Message-ID: <1573585373266-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can anyone tell me how to write simple linux command in a buildroot package
make file and make it work? It's working on the command line but not if I
add them to my make file and execute it.
I wanna add the following command:
$(curl -L https://sourceforge.net/projects/pwgen/files/latest/download >
./pwgen.tar.gz) 



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
