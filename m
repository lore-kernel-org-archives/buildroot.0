From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jan 2011 09:03:39 +0100
Subject: [Buildroot] [pull request] Pull request for branch
 for-2011.02/python-bump
In-Reply-To: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20110125090339.2d427f43@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jan 2011 12:01:28 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Here is a set of patches that improve Python support in Buildroot:
> Python is bumped to 2.7.1, the package is converted to the autotargets
> infrastructure, some third-party Python modules are introduced as
> examples, many minor issues were fixed.

I have pushed a new version, with the following changes :

 * Rebased on latest master (involved fixing a trivial conflict in
   package/multimedia/Config.in)

 * Remove the outermost BR2_PACKAGE_PYTHON condition from the py/pyc
   removal patch (8/10)

 * Added link in the python-serial package description in Config.in
   (9/10)

 * Added link in the python-mad package description in Config.in
   (10/10).

 * Added some missing final new lines here and there (python-mad,
   libffi, etc.)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
