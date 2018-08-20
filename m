From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 20:36:22 +0200
Subject: [Buildroot] [[PATCH v2 05/14] package/mender: symlink
 /var/lib/mender -> /data/mender
In-Reply-To: <20180820130914.22377-6-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-6-mirza.krak@northern.tech>
Message-ID: <CADHdJwC4ZJv7uAwX5OZfVr2xedHESE7en8TjSGrPKAt2qdsB3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 20, 2018 at 3:09 PM, Mirza Krak <mirza.krak@northern.tech> wrote:
> The Mender client will use /var/lib/mender to access the persistent data
> partition and expect the link to be in place.
>
> By default it points to /data, but this can easily be overriden by
> overriding the link in overlay_fs
>
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---
>  package/mender/mender.mk | 2 ++
>  1 file changed, 2 insertions(+)

Thanks Thomas for picking up my other patches.

Wondering if this one was missed or some other reason not to apply it?

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
