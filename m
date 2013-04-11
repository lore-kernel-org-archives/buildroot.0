From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Apr 2013 11:50:53 +0200
Subject: [Buildroot] [PATCH 2/2] arch: remove support for SuperH 2 and
	SuperH 3
In-Reply-To: <OF1A17C1C6.7A8E9AFD-ON80257B4A.00307FB4-80257B4A.0031DC13@eu.necel.com>
References: <1365362725-30251-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365362725-30251-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF1A17C1C6.7A8E9AFD-ON80257B4A.00307FB4-80257B4A.0031DC13@eu.necel.com>
Message-ID: <20130411115053.69f7d2af@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Apr 2013 10:04:33 +0100, phil.edworthy at renesas.com wrote:

> So, can we keep sh2a?

Ok, sure. I'll change the patch to remove only SH3. I'll try to contact
you separately whenever we have SH2 related build issues, when they are
not stricly noMMU related.

I presume you actually have real hardware to test the systems generated
by Buildroot?

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
