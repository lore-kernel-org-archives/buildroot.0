From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 20 Nov 2016 13:05:43 +0100
Subject: [Buildroot] [PATCH next v2] cmake: bump version to 3.7.0
In-Reply-To: <20161116000232.51cfc4fa@free-electrons.com>
References: <20161114131541.54948-1-Vincent.Riera@imgtec.com>
 <20161116000232.51cfc4fa@free-electrons.com>
Message-ID: <CAHXCMMKTEf_2UX8d=xRe=jGJno0=r-2OJS3C0c=-0QxS8BhkAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Wed, Nov 16, 2016 at 12:02 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Samuel,
>
> Since you are our CMake guy, could you please review/test this?
>
> More specifically, I'm interested in understanding if there are some
> potential compatibility issues with our packages that use a CMake-based
> build system.
>

From the changelog, I see no harmful changes for Buildroot in this release.

I gave it a try on top of the next branch, with as many target cmake
package enabled as possible, and forcing buildroot to build
host-cmake.
I got no error related to cmake bump.

[Samuel Martin: tested on next branch]
Tested-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
