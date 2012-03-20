From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Mar 2012 20:49:45 -0300
Subject: [Buildroot] [PATCH v1 1/1] uClibc 0.9.33 : patches from 0.9.32
 should be applied to uClibc 0.9.33 too.
In-Reply-To: <1332284023-32025-2-git-send-email-sagaert.johan@skynet.be>
References: <1332284023-32025-1-git-send-email-sagaert.johan@skynet.be>
 <1332284023-32025-2-git-send-email-sagaert.johan@skynet.be>
Message-ID: <5aeac6a432553d5304da188208c64720@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-20 19:53, Sagaert Johan wrote:

> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  ...x-e500-__fe_nomask_env-use-of-__set_errno.patch |   34 ++++++++++

This one is already fixed in uClibc commit 
5f1678b1df1153277590b114ccafcf6171923d75 in a different form, that's the 
reason the patch applies but it does nothing new.
It can't fix anything related to any target different than powerpc 
e500.
Regards.
