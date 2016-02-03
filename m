From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 09:31:32 +0100
Subject: [Buildroot] [PATCH] package: aespipe: add host variant
In-Reply-To: <56B122F5.9000002@vanguardiasur.com.ar>
References: <1454341047-14412-1-git-send-email-ariel@vanguardiasur.com.ar>
 <20160201200235.6cba4eb2@free-electrons.com>
 <56B122F5.9000002@vanguardiasur.com.ar>
Message-ID: <20160203093132.01b9d78c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ariel D'Alessandro,

On Tue, 2 Feb 2016 18:43:17 -0300, Ariel D'Alessandro wrote:

> The justification is pretty much what Arnout said:
> 
> ""
> Post-image scripts may want to encrypt the resulting image with aespipe
> (and decrypt it in the update tool on the target), so it is useful to
> have the host version and to be able to select it in the configuration.
> ""
> 
> In fact, that's exactly why I added host-aespipe to one of my projects.
> Is this enough to include it as a host package?

Yes, this justification is good. It should have been part of the commit
log originally though :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
