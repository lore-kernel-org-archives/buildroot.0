From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 5 Jan 2012 11:19:19 -0600
Subject: [Buildroot] customize package: odd copy construction
In-Reply-To: <20120105180624.380257c8@skate>
References: <CAAXf6LW1GnqA3fgU9zGXXMdevw+FxCBN2x4PUpCzxM-cHYJeUA@mail.gmail.com>
 <201201051027.05059.minimod@morethan.org> <20120105180624.380257c8@skate>
Message-ID: <201201051119.21069.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu January 5 2012, Thomas Petazzoni wrote:
> Le Thu, 5 Jan 2012 10:27:02 -0600,
> "Michael S. Zick" <minimod@morethan.org> a ?crit :
> 
> > It looks to me as if the intent was in the handling of symbolic links.
> > ls -d * does not dereference symbolic links.
> 
> So does 'cp -a', I think.
>

Right.  You caught me.  ;-)

cp -a: cp --no-dereference --preserve=all --recursive

I have to step to the other side of the floor and
join the group saying: "I don't see the point".

Unless there is a difference in the handling of hard
links or special files.

Mike
 
> Thomas
