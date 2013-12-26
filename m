From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Dec 2013 19:01:09 -0300
Subject: [Buildroot] [PATCH] aiccu: disable for uClibc 0.9.31/0.9.32
In-Reply-To: <1388079742-24548-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388079742-24548-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52BCA725.7030402@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/26/2013 02:42 PM, Thomas Petazzoni wrote:

> aiccu uses the dn_skipname() function, which was only introduced in
> uClibc 0.9.33. Therefore, we disable this package when uClibc 0.9.31
> and 0.9.32. Most likely, only AVR32 users will be affected by this, so
> we don't add a specific kconfig comment for that.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
