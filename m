From: Javier Viguera <javier.viguera@digi.com>
Date: Wed, 5 May 2010 12:39:43 +0200
Subject: [Buildroot] buildroot 2010.05-rc1 fail to build gst-plugins-ugly
In-Reply-To: <1273013593.6613.48.camel@coalu.atr>
References: <4BDEE442.4060006@digi.com>	<x2v4d28d4b51005030825o21717459p64184c1d83be2641@mail.gmail.com>	<4BDEF00E.4010008@digi.com>
	<1273013593.6613.48.camel@coalu.atr>
Message-ID: <4BE14AEF.3090800@digi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lionel Landwerlin wrote:
> I had partialy reproduced the problem in my environment.
> Here is the patch which fixed the problem.
> Please test.

Hi Lionel,

Tested your patch (applied over 2010.05-RC1) and it fixed the problem. 
Seems that now it finds the correct libraries to link.

Thanks.

-- 
Regards,

Javier Viguera
Software Engineer

Digi International Spain, S.A.
http://www.digi.com
