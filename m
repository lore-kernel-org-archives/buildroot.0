From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 13:59:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: rename package
 to python-pybind11
In-Reply-To: <20200618110209.5750-1-guillaume.bressaix@gmail.com>
References: <20200618110209.5750-1-guillaume.bressaix@gmail.com>
Message-ID: <20200618135910.25621d99@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Jun 2020 13:02:09 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

Your commit log is empty, which is not good.

> python-pybind only allows C++ -> python bindings at the moment.
> 
> As pointed by Asaf, we will face issues if we try to activate
> Python->C++ bindings in the future, because Cmake will
> search for 'pybind11' as a key word.

I don't understand how this is a justification for the renaming of the
package.

However, python-pybind11 indeed makes more sense because that's the
name of the upstream project. But that thing about CMake that will
search pybind11 as a keyword doesn't make much sense: CMake does not
care at all about what the Buildroot package name is.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
