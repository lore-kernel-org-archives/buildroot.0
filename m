From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 23:14:01 +0200
Subject: [Buildroot] [PATCH v3 10/16] libcgroup: new package
In-Reply-To: <OF65F0E18D.9A0E7DE2-ON86257BF7.006E0B8B-86257BF7.006E4047@rockwellcollins.com>
References: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
 <1380137571-688-11-git-send-email-clshotwe@rockwellcollins.com>
 <20131001214853.62a871b3@skate>
 <OF65F0E18D.9A0E7DE2-ON86257BF7.006E0B8B-86257BF7.006E4047@rockwellcollins.com>
Message-ID: <20131001231401.2856aca6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton,

On Tue, 1 Oct 2013 15:04:47 -0500, clshotwe at rockwellcollins.com wrote:

> > Maybe you want to resend just this patch with those fixes, so we can
> > get it merged quickly, independently of the other SELinux changes.
> 
> Should I do that with all of the simple patches?

It's a matter of strategy. When a relatively simple patch is part of a
larger, more complicated patch series, then it is unlikely to get
committed until the entire patch series gets committed. So,
strategically speaking, you might want to progressively reduce the size
of your patch series by merging parts of it that are independent of the
rest of the series, but are needed for it. Your libcgroup package is a
good candidate :)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
