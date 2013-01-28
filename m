From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Jan 2013 22:04:46 +0100
Subject: [Buildroot] [PATCHv2] python3: Fix pyc-only related runtime
	exceptions
In-Reply-To: <1359337136-14157-1-git-send-email-daniel@sigpwr.com> (Daniel
 Nelson's message of "Sun, 27 Jan 2013 17:38:56 -0800")
References: <1359313382-2257-1-git-send-email-daniel@sigpwr.com>
 <1359337136-14157-1-git-send-email-daniel@sigpwr.com>
Message-ID: <871ud5f28h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Nelson <daniel@sigpwr.com> writes:

 Daniel> Python3 changes the pyc lookup strategy, ignoring the
 Daniel> __pycache__ directory if the .py file is missing. Change
 Daniel> install location to enable use of .pyc without their parent .py

 Daniel> See http://www.python.org/dev/peps/pep-3147

 Daniel> Signed-off-by: Daniel Nelson <daniel@sigpwr.com>
 Daniel> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Daniel>   (untested)
 Daniel> ---
 Daniel>  .../python3/python3-3.3-012-old-stdlib-cache.patch | 53 ++++++++++++++++++++++
 Daniel>  package/python3/python3.mk                         |  4 ++
 Daniel>  2 files changed, 57 insertions(+)
 Daniel>  create mode 100644 package/python3/python3-3.3-012-old-stdlib-cache.patch

 Daniel> diff --git a/package/python3/python3-3.3-012-old-stdlib-cache.patch b/package/python3/python3-3.3-012-old-stdlib-cache.patch
 Daniel> new file mode 100644
 Daniel> index 0000000..23171d5
 Daniel> --- /dev/null
 Daniel> +++ b/package/python3/python3-3.3-012-old-stdlib-cache.patch

You forgot to add a patch header describing what it does. I've copied
your commit message to here and committed, thanks.

-- 
Bye, Peter Korsgaard
