From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 21:58:50 +0100
Subject: [Buildroot] [PATCH 06/14] gst1-plugins-bad: enable fdkaac plugin
In-Reply-To: <1478167120-3285-6-git-send-email-gustavo@zacarias.com.ar>
References: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
 <1478167120-3285-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161107215850.159c3853@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 06:58:32 -0300, Gustavo Zacarias wrote:
> It's new for 1.10.0, add an explicit option for the fdkaac plugin.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

I've updated this patch to add the dependencies of the fdk-aac package
(by re-using what was mistakenly in your PATCH 07/14). But as a
preparation patch, I've added a BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
hidden boolean, which allows to avoid repeating those architecture
dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
