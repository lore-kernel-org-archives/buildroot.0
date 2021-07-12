From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Jul 2021 17:54:25 -0300
Subject: [Buildroot] [RFC] board/mx6cubox: Switch to extlinux.conf
In-Reply-To: <CAB0FRsvr-Cre6ZvOCY7NR+ccy_o9JrQaGeKkC=nQ1gYVFFzY3g@mail.gmail.com>
References: <20210712162703.2937572-1-festevam@gmail.com>
 <CAB0FRstB6+32=F-JmTs4RS70A3uUt0feCa9VtF3rgX2GD1tOjw@mail.gmail.com>
 <CAOMZO5Dw6=v5ndry8AWgmx0iX_kFDsKPVeqRAhAbLEscuAfAEQ@mail.gmail.com>
 <CAB0FRsvr-Cre6ZvOCY7NR+ccy_o9JrQaGeKkC=nQ1gYVFFzY3g@mail.gmail.com>
Message-ID: <CAOMZO5Dij18r4_wyBpyGe2XwwmDYfMdVhC==6Pyyj=hat23A6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fran?ois,

On Mon, Jul 12, 2021 at 5:43 PM Fran?ois Perrad
<francois.perrad@gadz.org> wrote:

> OK fixed within interactive mode.

Thanks. I will submit a patch after yours is accepted (the one that
bumps kernel and U-Boot versions).

I also noticed that I need to fix the console variable in U-Boot as
your log indicated:
console=ttymxc0,115200,115200

I will drop the extra  115200.

Thanks
