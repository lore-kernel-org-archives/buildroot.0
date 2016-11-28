From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 28 Nov 2016 16:40:53 -0500
Subject: [Buildroot] [PATCH 1/1] documentation: hash source control
	archives
In-Reply-To: <20161128214317.5cbbc846@free-electrons.com>
References: <1480344142-6382-1-git-send-email-ash.charles@savoirfairelinux.com>
 <20161128214317.5cbbc846@free-electrons.com>
Message-ID: <CAK8F28=FHzqidW70bL6rndSJD7fwn=3HKW-+HeVsXyaQO9mPkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 28, 2016 at 3:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The line needs to be wrapped to 72 characters.
>
> Also, I am not sure that the archives we produce from all version
> control systems are reproducible. I'm sure it's the case for Git, but
> I'm not sure for Subversion, so it might be that your statement is
> actually wrong.
>
> In addition, I think the last part "although the +none+ type has also
> been used" is a bit confusing.
>
> I think we should rather:
>
>  1. Look again closely at which version control systems currently
>     produce reproducible archives in Buildroot.
>
>  2. Make Buildroot actually check the hashes for the downloads made
>     through those version control systems.
>
>  3. Update the documentation accordingly, with a clear statement of
>     which packages should have hashes, which packages should not.
Okay--I think this is more than I can dive into at the moment.  Either
way though, this isn't currently a suitable patch so I've marked it as
rejecetd in patchwork.
--Ash
