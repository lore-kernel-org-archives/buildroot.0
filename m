From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 11 Mar 2008 01:51:43 -0300
Subject: [Buildroot] [buildroot 0002514]: fakeroot has an invalid version
In-Reply-To: <3602fa0f2bfc9d33e7fe0380c3243a05@busybox.net>
References: <3602fa0f2bfc9d33e7fe0380c3243a05@busybox.net>
Message-ID: <d6cda7730803102151k687bc79ek9117e63ae3241dc8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

    Is debian.org the only source for those things? It's quite
annoying when they suddenly remove files from their servers... and
this happens just about all the time.

Kind Regards,
   Thiago A. Correa

On Mon, Mar 10, 2008 at 11:28 PM,  <bugs@busybox.net> wrote:
>
>  The following issue has been SUBMITTED.
>  ======================================================================
>  http://busybox.net/bugs/view.php?id=2514
>  ======================================================================
>  Reported By:                sg
>  Assigned To:                buildroot
>  ======================================================================
>  Project:                    buildroot
>  Issue ID:                   2514
>  Category:                   Other
>  Reproducibility:            always
>  Severity:                   block
>  Priority:                   normal
>  Status:                     assigned
>  ======================================================================
>  Date Submitted:             03-10-2008 19:28 PDT
>  Last Modified:              03-10-2008 19:28 PDT
>  ======================================================================
>  Summary:                    fakeroot has an invalid version
>  Description:
>  The version of fakeroot demanded by the current buildroot in
>  package/fakeroot/fakeroot.mk is 1.9. That version does not exist on
>  debain.org. The closest matching version is 1.9.3. However, the patch file
>  "fakeroot-revert-ltmain.patch" fails to apply against that version.
>  ======================================================================
>
>  Issue History
>  Date Modified   Username       Field                    Change
>  ======================================================================
>  03-10-08 19:28  sg             New Issue
>  03-10-08 19:28  sg             Status                   new => assigned
>  03-10-08 19:28  sg             Assigned To               => buildroot
>  ======================================================================
>
>  _______________________________________________
>  buildroot mailing list
>  buildroot at uclibc.org
>  http://busybox.net/mailman/listinfo/buildroot
>
