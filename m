From: Matthew Weber <matthew.weber@collins.com>
Date: Thu, 14 Jan 2021 17:50:08 -0600
Subject: [Buildroot] [PATCH 2/2] package/linux-pam: drop useless
 LINUX_PAM_CPE_ID_NAME definition
In-Reply-To: <20210114223432.456542-2-thomas.petazzoni@bootlin.com>
References: <20210114223432.456542-1-thomas.petazzoni@bootlin.com>
 <20210114223432.456542-2-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpayxdNgu3QGtski2pxGZ0LOHAMkscRj19kq8wMXm=mEOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Jan 14, 2021 at 4:35 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This definition is useless, because it is equal to the default value
> of <pkg>_CPE_ID_NAME as calculated by generic-package.
>
> Before and after this patch, the CPE ID calculated for the linux-pam
> package is exactly the same, according to "make linux-pam-show-info".
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
