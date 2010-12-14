From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 16:19:00 +0100
Subject: [Buildroot] Profiler, Memory debugger for ARM uclibc
In-Reply-To: <AANLkTi=xjujFnTPXbC6sftGikkLG-u_orC9jV3MptqMv@mail.gmail.com>
References: <AANLkTinzMQHbgujJJFhbLcwY5j_7gTrGKniVuusX1+qE@mail.gmail.com>
	<20101214133705.495adc3c@surf>
	<AANLkTi=xjujFnTPXbC6sftGikkLG-u_orC9jV3MptqMv@mail.gmail.com>
Message-ID: <20101214161900.74331c9a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Dec 2010 15:07:51 +0000
Arreche <arreche@gmail.com> wrote:

> Anybody knows profilers and memory debuggers that works int ARM uclibc?

 * oprofile for system profiling
   http://oprofile.sourceforge.net/

 * gprof for application profiling
   http://sourceware.org/binutils/docs-2.21/gprof/index.html

 * duma for "memory debugging"
   http://duma.sourceforge.net/

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
