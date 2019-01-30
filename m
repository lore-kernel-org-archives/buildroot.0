From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Jan 2019 08:39:26 +0100
Subject: [Buildroot] [PATCH] package/busybox: drop empty configure
 command
In-Reply-To: <21912_1548828053_5C513D95_21912_326_1_20190130060051.GA3548@r-lnx-nyma7486-2>
 (yann morin's message of "Wed, 30 Jan 2019 07:00:51 +0100")
References: <31287_1548765380_5C5048C4_31287_396_1_f8e0aabc-6c1f-4878-b75e-c8bbc4e1a17e@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <877een8og6.fsf@dell.be.48ers.dk>
 <21912_1548828053_5C513D95_21912_326_1_20190130060051.GA3548@r-lnx-nyma7486-2>
Message-ID: <87imy61tn5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <yann.morin@orange.com> writes:

 > Peter, All,
 > On 2019-01-29 16:37 +0100, Peter Korsgaard spake thusly:
 >> >>>>>   <yann.morin@orange.com> writes:
 >> 
 >> > Since commit 50dc350c65 (package/busybox: update to 1.29.0), we no
 >> > longer define the BUSYBOX_NOCLOBBER_INSTALL macro, so it expands to an
 >> > empty string, so we end up with no action in BUSYBOX_CONFIGURE_CMDS.
 >> 
 >> > Drop BUSYBOX_CONFIGURE_CMDS now that it serves no purpose.
 >> 
 >> > Signed-off-by: Yann MORIN <yann.morin@orange.com>
 >> 
 >> FYI, your author name was not configured correctly (was your email
 >> address):

 > Yeah, I have no idea why that is, because here, my 'From' was really what
 > you'd expect:

 >     From: "Yann E. MORIN" <yann.morin@orange.com>

 > But it seems my intelligent mail server stripped it out... Let's see how
 > that one will fare...

Still the same ;)

-- 
Bye, Peter Korsgaard
