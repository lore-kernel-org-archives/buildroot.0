From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 5 Oct 2015 10:31:00 -0400
Subject: [Buildroot] [PATCH v3 1/4] package/rpm: bump to version 4.12.0.1
In-Reply-To: <87h9m85988.fsf@dell.be.48ers.dk>
References: <1441293831-3524-1-git-send-email-james.knight@rockwellcollins.com>
 <87h9m85988.fsf@dell.be.48ers.dk>
Message-ID: <CALe+oY_HWF33rePJzZgH5QJw0A5en1KnNaGAFM34FHCdMXxTow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sat, Oct 3, 2015 at 10:15 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>  > +#ifeq ($(BR2_PACKAGE_LIBCAP),y)
>  > +RPM_DEPENDENCIES += libcap
>  > +RPM_CONF_OPTS += --with-cap
>  > +#else
>  > +RPM_CONF_OPTS += --without-cap
>  > +#endif
>
> Why is this commented out? You don't select libcap in Config.in.

It is definitely a mistake; sorry. I'll clean that up with the other
patchset changes to be made.
