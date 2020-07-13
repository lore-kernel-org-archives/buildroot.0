From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 22:05:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups-filters: add dejavu
 mandatory dependency
In-Reply-To: <20200713124642.741955-1-fontaine.fabrice@gmail.com>
References: <20200713124642.741955-1-fontaine.fabrice@gmail.com>
Message-ID: <20200713220546.4514bc2a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 14:46:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Since version 1.27.3, cups-filters needs dejavu (even if it is only used
> for test programs):
> https://github.com/OpenPrinting/cups-filters/commit/1d66106e5ae45407b01459cb112ee09752166dba
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0e141abc57e4185c74adce75cac4215dd8a3108b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I already pointed out this issue in a former patch that bumped cups-filters:

  https://patchwork.ozlabs.org/project/buildroot/patch/20200619145719.2352019-3-angelo at amarulasolutions.com/

But Angelo did not reply to my question, and then resubmitted the
version bump without taking care of the font issue:

  https://patchwork.ozlabs.org/project/buildroot/patch/20200624204347.797088-3-angelo at amarulasolutions.com/

So I thought it was resolved, but apparently not.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
