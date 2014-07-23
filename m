From: yuvaraj.patil at wipro.com <yuvaraj.patil@wipro.com>
Date: Wed, 23 Jul 2014 06:07:16 +0000
Subject: [Buildroot] [PATCH] quagga: Do not use fork on noMMU platforms
In-Reply-To: <20140720121022.65c59a81@free-electrons.com>
References: <1405684663-3100-1-git-send-email-yuvaraj.patil@wipro.com>
 <20140718140358.2ff1bf5b@free-electrons.com>
 <C89D20716E201D428CB114157FC1F4E380F18DF0@BLR-SJP-MBX-1.wipro.com>
 <20140720121022.65c59a81@free-electrons.com>
Message-ID: <C89D20716E201D428CB114157FC1F4E380F1AA61@BLR-SJP-MBX-1.wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sunday, July 20, 2014 3:40 PM, thomas.petazzoni at free-electrons.com wrote:

>You're being confused because you're doing a patch that adds a patch, and we do require a Signed-off-by line on both.

>We need a Signed-off-by in the commit log of the git commit that describes the Buildroot change, but we also require a Signed-off-by
>*inside* the patch you're adding, i.e inside the file that was named package/quagga/quagga.patch in your commit. We also require a description to be added in this file.

Thank you so much for the details information. 
Your inputs helped me to generate a patch as per the expectation.
I have generated another patch for "gnuplot" package which I will be sending shortly.
I hope this patch is as per the expectation.

Thanks
Yuvaraj patil
