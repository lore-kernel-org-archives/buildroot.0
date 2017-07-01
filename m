From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 1 Jul 2017 16:00:29 +0200
Subject: [Buildroot] [RFC PATCH v5 04/11] pkg-generic: create a list af
 installed files per step and package
In-Reply-To: <1498811828-6893-5-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-5-git-send-email-wg@grandegger.com>
Message-ID: <CAHXCMM+p=V+4J3ZBZwo7D6cB=x8juWOR2yGQnP=kJc=t39QhnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Wolfgang,

In the commit title: s/af/of/

On Fri, Jun 30, 2017 at 10:37 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
> The GLOBAL_INSTRUMENTATION_HOOKS "step_pkg_size*" are extended to create
> a file with the list of all installed files per step and package. The
> file name is "<package-build-dir>/.br_<host|staging|target>_filelist".
> This file could be used by other hooks to scan the installed files,
> e.g. to check the bin arch, the host rpath or for rpath sanitation.
>
> For a quick hack, the "packages-file-list.txt" is created as before.

Nit: you could add few words why you needed this here, but I figured
out while reviewing the rest of the series ;-)

Regards,

-- 
Samuel
