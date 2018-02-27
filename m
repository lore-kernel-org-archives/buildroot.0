From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 09:57:24 +0100
Subject: [Buildroot] [PATCH 1/1] rustc: disable for ARMV7A with EABI
In-Reply-To: <20180227093935.4be76eab@windsurf.lan> (Thomas Petazzoni's
 message of "Tue, 27 Feb 2018 09:39:35 +0100")
References: <20180226200421.18131-1-eric.le.bihan.dev@free.fr>
 <20180226235226.62ad68b3@windsurf.lan>
 <87zi3uq391.fsf@dell.be.48ers.dk>
 <20180227093935.4be76eab@windsurf.lan>
Message-ID: <87vaeiq07f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> I agree that having positive logic would be nicer. It is a bit more
 >> complicated than this as we also should handle ARMV8A cores in ARM mode
 >> similar to how ve handle ARMV7A.
 >> 
 >> Care to send an updated patch on top of master doing that?

 > I was hoping that Eric would handle that :-)

Fine by me. Eric? ;)

-- 
Bye, Peter Korsgaard
