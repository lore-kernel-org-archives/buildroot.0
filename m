From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 6 Nov 2017 16:03:19 +0530
Subject: [Buildroot] [PATCH v2] orange-pi-zero: misc updates
In-Reply-To: <20171106101652.28861-1-geomatsi@gmail.com>
References: <20171106101652.28861-1-geomatsi@gmail.com>
Message-ID: <CAMty3ZAH2GJVU84vm5VCRyR3VRq6anrvtM5sdz26xnrSC_QG9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 6, 2017 at 3:46 PM, Sergey Matyukevich <geomatsi@gmail.com> wrote:
> Hi all,
>
> This is the second iteration of the patchset which aimes at enabling WiFi
> on orange-pi-zero board right out-of-the-box. The first approach suggested
> to pull xr819 WiFi chip firmware from armbian repositories.
>
> Meanwhile it turned out that Armbian project created a separate github
> repository to keep firmware binary blobs for all their supported boards.
> Reviewers (Peter Korsgaard and Yann E. Morin) suggested to use new
> Armbian firmware repository and organize access to firmware files
> in a similar way to what linux-firmware does.

It would be good if you update or write some readme on board dir,
about how to test wifi

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
