From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Tue, 13 Nov 2018 23:19:26 +0100
Subject: [Buildroot] [PATCH] systemd: Explicitly configure
 split-usr=false and split-bin=true
In-Reply-To: <20181111215547.488b4a96@windsurf.home>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-7-alexander.sverdlin@gmail.com>
 <20181111215547.488b4a96@windsurf.home>
Message-ID: <d51164b2-20f6-74a7-290e-a0d2f742d2ed@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 11/11/2018 21:55, Thomas Petazzoni wrote:
>> bison-based build of systemd runs couple of checks on the structure of the
> I assume you wanted to say "meson-based build" and not "bison-based
> build". I've fixed that and applied to master. Thanks!

this commit BTW fixes 7684637bf6 ("systemd: bump to v239")
(broken PATH env passed to all services started by systemd),
so it can go to 2018.08.x...

--
Best regards,
Alexander.
