From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 22:19:31 +0200
Subject: [Buildroot] gdb texinfo dependency
In-Reply-To: <CAAXf6LXRG2My5hyc19CS+LBm3dUuopPMDd7EqBkFypGEi_0GmA@mail.gmail.com>
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
 <CAAXf6LXRG2My5hyc19CS+LBm3dUuopPMDd7EqBkFypGEi_0GmA@mail.gmail.com>
Message-ID: <20161007221931.28362f04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Oct 2016 21:34:09 +0200, Thomas De Schampheleire wrote:

> I think it is a matter of personal taste.
> The fact that : is a shell built-in means that it's a tad faster than
> spawning a separate 'true' process, but I really think it does not
> matter here.
> 'MAKEINFO=true' has the drawback that it gives the impression of
> _enabling_ makeinfo, to people that are not used to such
> constructions.
> 'MAKEINFO=:' has the drawback that it is cryptic; it is even less
> known to most people (I think).
> So I guess I'll stick to 'true'.

Yes, I also think that using "true" is less cryptic.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
