From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Dec 2016 10:45:42 +0100
Subject: [Buildroot] Autobuild reproduction and generation
In-Reply-To: <CADZ=QZ=5gbMyM0nVCb92+FuZn-WVpJDfMLNpNCm=suC-O8PmPg@mail.gmail.com>
References: <CADZ=QZ=SU7XthdVfaAQpeY7LKJcsOME1zOusWvZAEjs0OpRfZw@mail.gmail.com>
 <20161226092127.1c4a40d1@free-electrons.com>
 <CADZ=QZnpVmC_hKqSMFehhdO_m9pZsK0OBcfVd4hXsbvjV==A1g@mail.gmail.com>
 <20161226101659.57238bc6@free-electrons.com>
 <CADZ=QZ=uJ-5T+d-f5RJK3uv+paCyCCFA0ihwvSHrhTT45n1Fpw@mail.gmail.com>
 <20161226153935.54390a45@free-electrons.com>
 <CADZ=QZ=5gbMyM0nVCb92+FuZn-WVpJDfMLNpNCm=suC-O8PmPg@mail.gmail.com>
Message-ID: <20161227104542.4e025096@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Dec 2016 09:57:03 +0800, Yu-Ting, Kao wrote:

> I checked the 99381d37002db28566d1aba257418a38c9edee39 directory is deleted.

Thanks, I have reproduced and fixed the issue. See commit
https://git.buildroot.org/buildroot-test/commit/?id=1959fb62be4e0f967c47d5afdef8966723e7fd4e
for all the explanations.

Thanks for having reported the problem!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
