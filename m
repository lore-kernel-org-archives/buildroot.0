From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Thu, 15 Jan 2015 20:58:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/iojs: new package
In-Reply-To: <20150115093427.0b5118b2@free-electrons.com>
References: <1421278696-15122-1-git-send-email-jkrause@posteo.de>
 <20150115093427.0b5118b2@free-electrons.com>
Message-ID: <1421351925.2625.14.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Do, 2015-01-15 at 09:34 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Thu, 15 Jan 2015 00:38:16 +0100, J?rg Krause wrote:
> > io.js is a fork of Node.js. This package is mainly based on the nodejs
> > package, except for the patches.
> > 
> > io.js is currently marked as unstable and there is no stable release for now.
> > 
> > Signed-off-by: J?rg Krause <jkrause@posteo.de>
> 
> Immediate question that comes to mind: is the code base diverging from
> Node.js ?

Yes, it is.

> Do we need two separate packages ?

I would say yes. io.js is build against modern versions of V8 and libuv
and bundles a recent npm package. This enables the user the new features
from the upcoming JavaScript ECMA-262 specification (ES6).

From io.js ChangeLog:
"The io.js codebase inherits the majority of the changes found in the
v0.11 branch of the joyent/node repository and therefore can be seen as
an extension to v0.11."

> Does this fork has a chance of becoming widely used ? I'm a bit concerned by the fact of
> having two separate packages for basically the same thing.

I think of Node.js as an enterprise-driven and io.js as an
community-driven project. Both have different goals, and will have
different feature sets in the future. IMO it's good for the user to
decide, which platform he want to use concerning his demands.

Best regards
J?rg Krause
