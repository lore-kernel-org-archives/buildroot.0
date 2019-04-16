From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Apr 2019 22:10:38 +0200
Subject: [Buildroot] [PATCH 09/12 v2] core: introduce new global
 show-info
In-Reply-To: <2f487d6e-97d6-497d-561d-d6c526e36fe8@mind.be> (Arnout
 Vandecappelle's message of "Tue, 16 Apr 2019 21:49:03 +0200")
References: <cover.1555273025.git.yann.morin.1998@free.fr>
 <e0509e7ca0439176b7f483afb7436bb85c4fbed3.1555273025.git.yann.morin.1998@free.fr>
 <357abbd3-e69f-1756-2112-587e9e8c850e@mind.be>
 <87tveye0yq.fsf@dell.be.48ers.dk>
 <2f487d6e-97d6-497d-561d-d6c526e36fe8@mind.be>
Message-ID: <87pnplemo1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> That should be pretty trivial to do with jq, E.G. something like:
 >> 
 >> https://stackoverflow.com/questions/25378013/how-to-convert-a-json-object-to-key-value-format-in-jq

 >  Yes, but then jq needs to be installed. The point is to be able to use the
 > show-info output in our own shell scripts without requiring an additional
 > package to be installed.

Ok, but we do have a host-jq package and jq has no extra dependencies.

-- 
Bye, Peter Korsgaard
