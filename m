From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Dec 2017 22:32:05 +0100
Subject: [Buildroot] [PATCH] libostree: change license to LGPL-2.0+
In-Reply-To: <20171207120313.25510-1-marcus.folkesson@gmail.com> (Marcus
 Folkesson's message of "Thu, 7 Dec 2017 13:03:13 +0100")
References: <20171207120313.25510-1-marcus.folkesson@gmail.com>
Message-ID: <87o9na2pii.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcus" == Marcus Folkesson <marcus.folkesson@gmail.com> writes:

 > The license is actually GNU LIBRARY GENERAL PUBLIC LICENSE
 > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Committed, thanks. src/libostree/ostree.h interesting enough refers to
the 'lesser general public license' (E.G. the "new" meaning of LGPL from
v2.1), but also still refers to 'version 2'.

-- 
Bye, Peter Korsgaard
