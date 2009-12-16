From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 16 Dec 2009 18:52:01 +0000 (UTC)
Subject: [Buildroot] Did output/staging change to
	output/build/staging_dir?
References: <hgb6iv$iue$1@ger.gmane.org> <878wd27oa8.fsf@macbook.be.48ers.dk>
Message-ID: <hgba8h$31e$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-12-16, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:
>
> Grant> Should I update the docs to reflect the fact that
> Grant> output/staging has apparently moved to output/build/staging_dir?
>
> No it hasn't (that's the old location). What might be happening is that
> you are using an old .config with
> BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir".

Doh!  I was comparing a build that I configured manually with
one that used the integrator defconfig.

-- 
Grant Edwards                   grante             Yow! FROZEN ENTREES may
                                  at               be flung by members of
                               visi.com            opposing SWANSON SECTS ...
