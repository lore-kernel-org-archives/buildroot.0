From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 12:54:52 +0100
Subject: [Buildroot] [PATCH v2] package/minicom: make default port and
 lock directory fixed defaults
In-Reply-To: <0102016ea7200662-f8edd1c2-afe0-49e9-b3c7-edfd26668a59-000000@eu-west-1.amazonses.com>
References: <0102016e8e961113-8b7cfd63-a693-49fd-93a3-70b7bb311860-000000@eu-west-1.amazonses.com>
 <0102016ea7200662-f8edd1c2-afe0-49e9-b3c7-edfd26668a59-000000@eu-west-1.amazonses.com>
Message-ID: <20191126125452.20028212@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 09:52:04 +0000
James Byrne <james.byrne@origamienergy.com> wrote:

> Minicom's configure script will set values for the default port and lock
> directory based on the configuration of the host machine, which is not
> useful for cross-compiling or reproducible builds, so instead set them
> to sensible default values.
> 
> Signed-off-by: James Byrne <james.byrne@origamienergy.com>
> 
> ---
> Changes v1 -> v2:
>   - Use fixed default values instead of configurable ones.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
