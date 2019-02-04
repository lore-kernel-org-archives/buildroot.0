From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Feb 2019 07:15:00 -0600
Subject: [Buildroot] [PATCH] qemu: remove host-python dependency.
In-Reply-To: <20190204124323.2865-1-aduskett@gmail.com>
References: <20190204124323.2865-1-aduskett@gmail.com>
Message-ID: <CANQCQpY=kVxQ+V5K8f5FedBFa2sWoB25jPDevtBGtCz4C2c3HQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Mon, Feb 4, 2019 at 6:43 AM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Now that BuildRoot requires python >= 2.7, qemu no longer needs a host-python,
> as it does not use any external Python modules to build.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>


Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
