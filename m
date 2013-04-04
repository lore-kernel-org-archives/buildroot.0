From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 04 Apr 2013 19:01:28 -0300
Subject: [Buildroot] [PATCH 1/2] support/kconfig: upgrade to 3.9-rc2
In-Reply-To: <1365110666-3080-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365110666-3080-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365110666-3080-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <515DF838.3000805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/04/2013 06:24 PM, Thomas Petazzoni wrote:

> Our kconfig code is updated to the version of kernel 3.9-rc2. No major
> issues during the migration, except:
> 
>  * Some conflicts when applying 03-change-config-option-prefix.patch
>    due to upstream kernel changes.
> 
>  * The need of adding a new patch, 15-fix-qconf-moc-rule.patch, to fix
>    the make rule that generates the moc file for the Qt-based
>    interface.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
