INSERT INTO public.actiities (
    user_uuid,
    message,
    expires_at
)
VALUES (
    (SELECT uuid 
    FROM public.users 
    WHERE users.handle = %(handle)s
    LIMIT 1
    ),
    %(message)s,
    %s(expires_at)s
    ) RETURNING uuid;