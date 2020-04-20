From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 18:00:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/stella: fix legal-info
In-Reply-To: <20200420142309.549296-1-fontaine.fabrice@gmail.com>
References: <20200420142309.549296-1-fontaine.fabrice@gmail.com>
Message-ID: <20200420180029.5fad4d18@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 16:23:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit a7210c24e343a13e58d1d45b7e0c4bdb51854857 forgot to update hash of
> Copyright which has changed due to update in year:
> 
> https://github.com/stella-emu/stella/commit/275666b0af3e029b44be7e676526b8172da44736
> https://github.com/stella-emu/stella/commit/9ad47ae5f3457693944a3754432ff1236c67203c
> 
> While at it, update indentation of hash file to two spaces
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/38fa47221f36f3db603ee54c86b9747b0c6ca5d7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/stella/stella.hash | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
