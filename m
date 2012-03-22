From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Thu, 22 Mar 2012 10:54:51 +0100
Subject: [Buildroot] Can I use the toolchain build with buildroot,
	as an external toolchain ?
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6703136FE8@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

Thomas, gave me a hint on how to make 'full' compiles faster.

<<Thomas Petazzoni>>
>>Another way of speeding up the build is to use an external toolchain
if you're not 
>>already using. You can also enable the ccache
>>feature (be sure to have the latest ccache fixes, otherwise ccache is
basically
>>unused).

Q: Can I use a toolchain that has been build with buildroot (before) as
an external toolchain ?

Q: Is this explained somewhere, on how to do this ?


Thanks,
Noel
