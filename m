From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 08:51:29 +0100
Subject: [Buildroot] [PATCH/next 1/1] linuxptp: fix build with kernel
 headers >= 4.19
In-Reply-To: <20181210015934.ts3hvqehn2qvnlxj@localhost>
References: <20181129214730.7225-1-fontaine.fabrice@gmail.com>
 <n87bm676vhs.fsf@tkos.co.il> <20181209224120.54c35b43@windsurf>
 <20181210015934.ts3hvqehn2qvnlxj@localhost>
Message-ID: <20181210085129.3653fb0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Richard,

On Sun, 9 Dec 2018 17:59:34 -0800, Richard Cochran wrote:

> > However, 4.19 is already released with this clockid_t reference, so I
> > guess we will anyway have to support that ?  
> 
> Please take this question up with Jesus Sanchez-Palencia on netdev
> mailing list.

Yesterday, when I replied to this thread, which has Jesus in Cc, I got:

<jesus.sanchez-palencia@intel.com>: host mga14.intel.com[192.55.52.115] said:
    550 #5.1.0 Address rejected. (in reply to RCPT TO command)

So I'm not sure what's going on, but Jesus is probably not receiving
all his e-mails.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
