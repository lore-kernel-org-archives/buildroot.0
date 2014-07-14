From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Jul 2014 08:07:47 -0300
Subject: [Buildroot] [PATCH 2/3] infra: add gettextize run in AUTORECONF
In-Reply-To: <20140714130104.480ab4cf@free-electrons.com>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>	<1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>
 <20140714130104.480ab4cf@free-electrons.com>
Message-ID: <53C3BA03.2080006@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/2014 08:01 AM, Thomas Petazzoni wrote:

> I believe I would actually prefer a separate GETTEXTIZE option, I'm a
> little bit worried about the extra build time. What do others think?

Expanding a little bit on my rationale i opted for simplicity when
making the patch ("fix it quick"), and it may not be that
straightforward to document.
Also it only add big time to the autoreconf deps, a gettextize run is
usually quite quick, in the one digit seconds.
Regards.
