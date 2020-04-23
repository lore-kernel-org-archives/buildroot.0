From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 21:44:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-jedi: fix license
In-Reply-To: <20200423101403.913557-1-fontaine.fabrice@gmail.com>
References: <20200423101403.913557-1-fontaine.fabrice@gmail.com>
Message-ID: <20200423214423.5b04970e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Apr 2020 12:14:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python-jedi bundles its own copy of typeshed since version 0.14.0 and
> https://github.com/davidhalter/jedi/commit/7d2b7bb3c1c4f79f325ccbde9d2b2734aa872312
> 
> So add it to the license files (and update indentation of hash file to
> two spaces while at it)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-jedi/python-jedi.hash | 9 +++++----
>  package/python-jedi/python-jedi.mk   | 5 +++--
>  2 files changed, 8 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
