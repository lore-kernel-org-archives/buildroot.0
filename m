From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 22:18:59 +0200
Subject: [Buildroot] gdb texinfo dependency
In-Reply-To: <CAAXf6LVADUKKkpL-fjgUKv0+tsM1wUOZeo5dDKf1c4=2Eti9cQ@mail.gmail.com>
References: <CAAXf6LUHdDJyUPNcW-vQuZx6RhZxsPrGv69SqRPvRrAy46ropA@mail.gmail.com>
 <20161005172756.77aea89c@free-electrons.com>
 <CAAXf6LUJOwtpDmUg1zxDdBDKnOAnjkafxwuCAVRQP5aMm3zT9g@mail.gmail.com>
 <20161005221619.6a958ba0@free-electrons.com>
 <b6d8768f-9192-6e0a-0299-36584151f4e7@gmail.com>
 <CAAXf6LX5+csACE8dRjdL+ue-JYpGbCsHZDjQ=KOuaESuoehgDA@mail.gmail.com>
 <CAAXf6LWaBL_cifwis=3Y1NYLMgt0m1=eOmb99UqGyzgxF7FikQ@mail.gmail.com>
 <20161006213626.5147dc08@free-electrons.com>
 <CAAXf6LUwubkNu9+25LUZyOMchdFfHjYUa5pzdfOF9xYfjzWamA@mail.gmail.com>
 <CAAXf6LXcZ2BOc+znu6GQFX3oC=LVAYO=inYGwk83JKHRQR2T-g@mail.gmail.com>
 <CAAXf6LUeqZPO=QCcW189s6yvrtMXwvDsFrij0vn8U+tjjULYrw@mail.gmail.com>
 <20161007142118.657d18ee@free-electrons.com>
 <16077173-0053-4A97-B519-674A9C7146D1@gmail.com>
 <CAAXf6LVADUKKkpL-fjgUKv0+tsM1wUOZeo5dDKf1c4=2Eti9cQ@mail.gmail.com>
Message-ID: <20161007221859.1a4641a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Oct 2016 21:36:40 +0200, Thomas De Schampheleire wrote:

> > I think for target packages ignoring info files is fine for small
> > systems and other doc related code like manpages.
> > for host packages may be it is still useful  
> 
> The purpose of Buildroot is to build a target system. The host
> packages are just there to help with that goal. I don't think we
> should care for documentation, even for host packages. If people want
> to read documentation of a package, they should use other means,
> either search the internet, read the documentation directly in the
> source tree, consult the documentation on their own host system, ...

Agreed. We don't build or care about the documentation, regardless of
whether it is for target or host packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
