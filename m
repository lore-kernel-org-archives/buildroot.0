From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 18 Jul 2021 11:00:22 +0200
Subject: [Buildroot] Using Intel TBB in Buildroot environment
In-Reply-To: <SJ0PR08MB6542FA0233EE2F8E14C32938B8129@SJ0PR08MB6542.namprd08.prod.outlook.com>
References: <SJ0PR08MB6542FA0233EE2F8E14C32938B8129@SJ0PR08MB6542.namprd08.prod.outlook.com>
Message-ID: <20210718110022.5f319b04@gmx.net>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Scott,

On Thu, 15 Jul 2021 20:39:00 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:

> Hi all,
>
> Is it possible to use Intel Threading Building Blocks in a Buildroot environment?  I am having trouble compiling our application when I include the tbb library.  I have the application working fine running on Raspbian on a RPi.  But when I try to cross compile it for Buildroot I am getting undefined references to tbb::detail::*.  I am trying to use the same libraries that I used in Raspbian.  Do I need to recompile the libraries for buildroot?  If so, does anyone have any experience doing this?

Not experience on this one, but your compile/link failure is hard to judge
without further information what you are trying exactly, but in general
integrating the used libraries/packages into the buildroot system seems
the natural way to go, patches welcome ;-)

Regards,
Peter

>
> Thanks,
> Scott
>
