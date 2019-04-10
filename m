From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Apr 2019 12:36:53 +0200
Subject: [Buildroot] [PATCH 1/1] .flake8: fix check for 80/132 columns
In-Reply-To: <f9471102-712c-1dc9-a506-7bba31aa1fbd@mind.be>
References: <20190409001729.3422-1-ricardo.martincoski@gmail.com>
 <f9471102-712c-1dc9-a506-7bba31aa1fbd@mind.be>
Message-ID: <34b4606f-8be7-fec7-2b42-edf7bc41d994@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/04/2019 12:33, Arnout Vandecappelle wrote:
>  My flake8 finds a lot of errors that the one it gitlab-ci doesn't find:

 Scratch that - I still had a lot of .orig files lying around...

 The only ones I do get are:

95    W605 invalid escape sequence '\['

 Regards,
 Arnout
