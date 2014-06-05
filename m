From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Jun 2014 22:39:28 +0200
Subject: [Buildroot] Build Output
In-Reply-To: <5390C49C.9080209@ethertek.ca>
References: <5390C49C.9080209@ethertek.ca>
Message-ID: <20140605223928.3794a407@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dan Pattison,

On Thu, 05 Jun 2014 12:27:24 -0700, Dan Pattison wrote:

> I am using the post image script feature to compile and install various 
> custom packages. In my shell and make files I want to make the ouput 

Why don't you create additional Buildroot packages instead? That would
be a lot more logical that doing this in a post-image script.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
