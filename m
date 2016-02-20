From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 19:25:43 +0100
Subject: [Buildroot] [PATCH v2 06/18] erlang-fast_tls: new package
In-Reply-To: <1454443064-14269-7-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-7-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160220192543.7ec0866c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Tue,  2 Feb 2016 14:57:32 -0500, Frank Hunleth wrote:
> This package is used by the newer versions of the ejabberd dependencies.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

I've applied to next, but the only package that used this was
erlang-p1-stun (after your version bump), but in fact it still uses
erlang-p1-tls and not erlang-fast_tls. It would be good if you could
clarify this. So this package is in fact not used by ejabberd.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
