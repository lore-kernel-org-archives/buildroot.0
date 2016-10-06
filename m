From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Oct 2016 21:36:26 +0200
Subject: [Buildroot] gdb texinfo dependency
In-Reply-To: <CAAXf6LWaBL_cifwis=3Y1NYLMgt0m1=eOmb99UqGyzgxF7FikQ@mail.gmail.com>
References: <CAAXf6LUHdDJyUPNcW-vQuZx6RhZxsPrGv69SqRPvRrAy46ropA@mail.gmail.com>
 <20161005172756.77aea89c@free-electrons.com>
 <CAAXf6LUJOwtpDmUg1zxDdBDKnOAnjkafxwuCAVRQP5aMm3zT9g@mail.gmail.com>
 <20161005221619.6a958ba0@free-electrons.com>
 <b6d8768f-9192-6e0a-0299-36584151f4e7@gmail.com>
 <CAAXf6LX5+csACE8dRjdL+ue-JYpGbCsHZDjQ=KOuaESuoehgDA@mail.gmail.com>
 <CAAXf6LWaBL_cifwis=3Y1NYLMgt0m1=eOmb99UqGyzgxF7FikQ@mail.gmail.com>
Message-ID: <20161006213626.5147dc08@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Oct 2016 20:59:47 +0200, Thomas De Schampheleire wrote:

> Seems my mail was a bit cryptic, sorry... see below

Indeed. With the replacements, it makes sense.

Can you submit patches to fix this? Something like:

 1/ Fixing this in binutils
 2/ Fixing this in gdb
 3/ Removing (again) the host-texinfo package

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
