From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 25 Feb 2014 17:07:22 +0100
Subject: [Buildroot] [PATCH v2 1/2] packages: improve dependency check
 in virtual packages.
In-Reply-To: <1393343137-4209-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1393343137-4209-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393343137-4209-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAHXCMMLhgg3DXf0kySrGH2VTbvv0EMbrcO2jdatd4A=WLZfn6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 25, 2014 at 4:45 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> The current version of dependency check for virtual package <foo>
> defines FOO_CONFIGURE_CMDS to print an error message if the
> dependencies are not met.
>
> This patch updates all the virtual packages to use the GNU Make control
> function $(error text...) instead.
>
> This makes the error happen at the beginning of the build, with a clearer
> message.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
