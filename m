From: Will Moore <will.moore@beraninstruments.com>
Date: Mon, 10 May 2010 10:24:52 +0100
Subject: [Buildroot] Method of moving to new releases of buildroot
References: <000c01caec58$eb209a20$6f01a8c0@apexlaptop>
	<87bpcubgz5.fsf@macbook.be.48ers.dk> 
Message-ID: <92845763320042419CF46BEE34059A68@AP366>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As a point of process, how is it intended that a user moves to a new version
of buildroot?

I tried making 2010.05 rc1 with my 2010.02 buildroot, kernel and busybox
.config files from 2010.02 (just accepting default new configuration
options) but found the build failed due to the previously mentioned problem
with uclibc and usleep when building gdbserver for the target.

Please can those with more experience of buildroot let me know if what I did
was a) daft and bound to fail or b) acceptable practice but failed in this
instance.  What do others do?

Thanks,



Will
