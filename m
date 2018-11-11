From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Mon, 12 Nov 2018 00:41:20 +0100
Subject: [Buildroot] [PATCH] systemd: Explicitly configure
 split-usr=false and split-bin=true
In-Reply-To: <20181111215547.488b4a96@windsurf.home>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-7-alexander.sverdlin@gmail.com>
 <20181111215547.488b4a96@windsurf.home>
Message-ID: <64c4320e-6eaa-7033-8b3f-97c7da9a9fd5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On 11/11/2018 21:55, Thomas Petazzoni wrote:
>> bison-based build of systemd runs couple of checks on the structure of the
> I assume you wanted to say "meson-based build" and not "bison-based

Exactly, thanks!

> build". I've fixed that and applied to master. Thanks!

--
Alexander.
