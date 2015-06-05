From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 5 Jun 2015 14:06:21 +0200
Subject: [Buildroot] [PATCH 04/12] fs/iso9660: enable Joliet extension
In-Reply-To: <1433430330-2166-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMLespexmbKEiPtnuBVmQOrdyv6fqXm+yV838S6QCbrPjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 4, 2015 at 5:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> We already enable the Rockridge extension by default when building
> ISO9660, so let's also enable the Joliet extension which allows to
> support Unicode file names and long file names.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
