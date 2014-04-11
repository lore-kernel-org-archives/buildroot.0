From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Fri, 11 Apr 2014 16:39:04 +0100
Subject: [Buildroot] [PATCH 3/3] package/zile: add Zile is Lossy Emacs
	editor
In-Reply-To: <1397225156-23112-4-git-send-email-alex.bennee@linaro.org>
References: <1397225156-23112-1-git-send-email-alex.bennee@linaro.org>
 <1397225156-23112-4-git-send-email-alex.bennee@linaro.org>
Message-ID: <87sipj510n.fsf@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Alex Benn?e <alex.bennee@linaro.org> writes:

> This is a lightweight Emacs clone useful for embedded systems. I nabbed
> the help2man disable patch from OpenEmbedded.

I forgot to mention the disable patch was never sent upstream as their
policy is not to submit tweaks to the configure scripts. The alternative
is to submit a patch upstream that enables the disabling of document
generation.

-- 
Alex Benn?e
