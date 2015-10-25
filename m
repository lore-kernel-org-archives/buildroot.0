From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:37:12 +0100
Subject: [Buildroot] [PATCH 2/2] jq: enable host package
In-Reply-To: <CAAXf6LU_vNHQRcCQAPs-61tkPdgTA8RzuJUaJj3mNwuv7DUKfw@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 22 Oct 2015 21:22:55
 +0200")
References: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
 <1445251329-18120-2-git-send-email-patrickdepinguin@gmail.com>
 <20151021223958.5605a589@free-electrons.com>
 <20151022163902.GA3797@free.fr>
 <CAAXf6LU_vNHQRcCQAPs-61tkPdgTA8RzuJUaJj3mNwuv7DUKfw@mail.gmail.com>
Message-ID: <87twpeheh3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > On Thu, Oct 22, 2015 at 6:39 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

 > In practice, we are using JSON files to pass some configuration to
 > applications. Different boards need different configuration, and jq
 > provides easy manipulation and reading of such files on the cmd-line
 > (and jansson can be used to read such files from the application).
 > Some of our JSON files are pre-existing in a rootfs overlay; in this
 > case we use host-jq to run a syntax check.
 > Some of them are dynamically generated and combined from the build
 > process using host-jq.

 > Hope this helps to convice you all :)

For me it does atleast - Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
