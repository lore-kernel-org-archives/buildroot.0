From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Tue, 15 Apr 2008 13:00:58 +0530
Subject: [Buildroot] [PATCH] UBOOT: Provide Version selection option to
	user
References: <16695022.post@talk.nabble.com>
	<87skxna8zg.fsf@macbook.be.48ers.dk>
Message-ID: <5BF78BCE8D9BF14A83F836BD9E3916BA0DDBEB@blrms.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
Korsgaard
>
>This doesn't apply to trunk - Uboot is now at v1.3.2.
>
>Why would you want a version selector here? Is something not working in
1.3.2?

Hi,

my custom board or in general if anyone's board uboot is not yet ported
to latest version then they can select a previous most recent version.
Same like gdb version. even latest is gdb 6.8 we have options starting
at 6.4 in buildroot. 

Hence i added this.  Default is pointing to 1.3.1 just to make sure its
works for all boards. This can be changed while committing

Regards
Gururaja
