From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 May 2014 09:36:51 +0200
Subject: [Buildroot] virtual-packages: the case for multiple providers
	selected
In-Reply-To: <CAAXf6LUKpS7cg53fAZeu8zma22pZw7Tpw0t25cFdxdijtSrzww@mail.gmail.com>
References: <20140513180945.GC3507@free.fr>
 <a67a948f-b496-4385-9796-fc2d079d9641@email.android.com>
 <20140513221833.016e1d8e@free-electrons.com>
 <CAAXf6LXa0MRtnb8xQ266J+O1Tp5BkWzVWJP7C3aYZCGbx8gd0w@mail.gmail.com>
 <20140514093014.315bd371@free-electrons.com>
 <CAAXf6LUKpS7cg53fAZeu8zma22pZw7Tpw0t25cFdxdijtSrzww@mail.gmail.com>
Message-ID: <20140514093651.38207fb3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 14 May 2014 09:34:43 +0200, Thomas De Schampheleire wrote:

> Yes indeed. It's not nice, but it's possible.

But makes the BR2_EXTERNAL usage really ugly :/

> By the way, it also means that whenever a new choice is added, every
> BR2_EXTERNAL in the world needs to be updated in order to work
> correctly.
> 
> This could be solved if it were possible to merge a set of dummy such
> files with the actual BR2_EXTERNAL. Or by using different env
> variables BR2_EXTERNAL_FOR_CHOICE_EGL, BR2_EXTERNAL_FOR_CHOICE_OPENVG,
> ... where these variables are set to either BR2_EXTERNAL or
> dummy-external, depending on the existence of the corresponding file.
> These variables would be set by buildroot, before calling menuconfig.
> But as you can see, it becomes very ugly.

Yes it does :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
