PGDMP  -                    |            DraftKingsBD    16.2    16.2 ;    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    16398    DraftKingsBD    DATABASE     �   CREATE DATABASE "DraftKingsBD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "DraftKingsBD";
                postgres    false            �            1259    16400    team    TABLE     \   CREATE TABLE public.team (
    id_team integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.team;
       public         heap    postgres    false            �            1259    16399    equipos_id_equipo_seq    SEQUENCE     �   CREATE SEQUENCE public.equipos_id_equipo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.equipos_id_equipo_seq;
       public          postgres    false    216            ,           0    0    equipos_id_equipo_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.equipos_id_equipo_seq OWNED BY public.team.id_team;
          public          postgres    false    215            �            1259    16433    player_statistics    TABLE     +  CREATE TABLE public.player_statistics (
    id_player_statistics integer NOT NULL,
    player_id integer,
    fluctuation_value character varying(5),
    average numeric(5,2),
    score_player integer,
    points_antepenultimate_match integer,
    game_played integer,
    minutes_played integer,
    goals integer,
    assists integer,
    assists_without_goal integer,
    balls_into_area integer,
    clearances integer,
    dribbles integer,
    kicks_to_goal integer,
    recovered_balls integer,
    possession_loss integer,
    penaltis_failed integer,
    goals_against integer,
    red_cards integer,
    ball_stop integer,
    penalties_made integer,
    yellow_cards integer,
    second_yellow_card_match integer,
    penalties_caused integer,
    penalties_stopped integer,
    own_goals integer
);
 %   DROP TABLE public.player_statistics;
       public         heap    postgres    false            �            1259    16432 .   estadisticasjugador_id_estadisticasjugador_seq    SEQUENCE     �   CREATE SEQUENCE public.estadisticasjugador_id_estadisticasjugador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.estadisticasjugador_id_estadisticasjugador_seq;
       public          postgres    false    222            -           0    0 .   estadisticasjugador_id_estadisticasjugador_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.estadisticasjugador_id_estadisticasjugador_seq OWNED BY public.player_statistics.id_player_statistics;
          public          postgres    false    221            �            1259    16407    player    TABLE     �  CREATE TABLE public.player (
    id_player integer NOT NULL,
    name character varying(255),
    foot character varying(10),
    team character varying(255),
    short_name_position character varying(50),
    age integer,
    " shirt_number" integer,
    market_value_mister_fantasy numeric(10,2),
    nationality character varying(50),
    image_url character varying(255),
    team_id integer
);
    DROP TABLE public.player;
       public         heap    postgres    false            �            1259    16406    jugador_id_jugador_seq    SEQUENCE     �   CREATE SEQUENCE public.jugador_id_jugador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jugador_id_jugador_seq;
       public          postgres    false    218            .           0    0    jugador_id_jugador_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.jugador_id_jugador_seq OWNED BY public.player.id_player;
          public          postgres    false    217            �            1259    16421    prediction_results    TABLE     �   CREATE TABLE public.prediction_results (
    id_result integer NOT NULL,
    player_id integer,
    old_score integer,
    predicted_score integer,
    old_price bigint,
    predicted_price bigint,
    prediction_date date
);
 &   DROP TABLE public.prediction_results;
       public         heap    postgres    false            �            1259    16420 )   resultados_predicciones_id_resultados_seq    SEQUENCE     �   CREATE SEQUENCE public.resultados_predicciones_id_resultados_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.resultados_predicciones_id_resultados_seq;
       public          postgres    false    220            /           0    0 )   resultados_predicciones_id_resultados_seq    SEQUENCE OWNED BY     n   ALTER SEQUENCE public.resultados_predicciones_id_resultados_seq OWNED BY public.prediction_results.id_result;
          public          postgres    false    219            �            1259    16454    tokens    TABLE     �   CREATE TABLE public.tokens (
    id_tokens integer NOT NULL,
    user_id integer,
    token character varying(255),
    date_expiration timestamp without time zone
);
    DROP TABLE public.tokens;
       public         heap    postgres    false            �            1259    16453    tokens_id_tokens_seq    SEQUENCE     �   CREATE SEQUENCE public.tokens_id_tokens_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tokens_id_tokens_seq;
       public          postgres    false    226            0           0    0    tokens_id_tokens_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tokens_id_tokens_seq OWNED BY public.tokens.id_tokens;
          public          postgres    false    225            �            1259    16445    user    TABLE     �   CREATE TABLE public."user" (
    id_user integer NOT NULL,
    email character varying(255),
    password character varying(255),
    creation_date date
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16466    user_player    TABLE     �   CREATE TABLE public.user_player (
    id_user_player integer NOT NULL,
    user_id integer,
    player_id integer,
    date date
);
    DROP TABLE public.user_player;
       public         heap    postgres    false            �            1259    16444    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public          postgres    false    224            1           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public."user".id_user;
          public          postgres    false    223            �            1259    16465 ,   usuariosxjugadores_id_usuariosxjugadores_seq    SEQUENCE     �   CREATE SEQUENCE public.usuariosxjugadores_id_usuariosxjugadores_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.usuariosxjugadores_id_usuariosxjugadores_seq;
       public          postgres    false    228            2           0    0 ,   usuariosxjugadores_id_usuariosxjugadores_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.usuariosxjugadores_id_usuariosxjugadores_seq OWNED BY public.user_player.id_user_player;
          public          postgres    false    227            o           2604    16410    player id_player    DEFAULT     v   ALTER TABLE ONLY public.player ALTER COLUMN id_player SET DEFAULT nextval('public.jugador_id_jugador_seq'::regclass);
 ?   ALTER TABLE public.player ALTER COLUMN id_player DROP DEFAULT;
       public          postgres    false    217    218    218            q           2604    16436 &   player_statistics id_player_statistics    DEFAULT     �   ALTER TABLE ONLY public.player_statistics ALTER COLUMN id_player_statistics SET DEFAULT nextval('public.estadisticasjugador_id_estadisticasjugador_seq'::regclass);
 U   ALTER TABLE public.player_statistics ALTER COLUMN id_player_statistics DROP DEFAULT;
       public          postgres    false    222    221    222            p           2604    16424    prediction_results id_result    DEFAULT     �   ALTER TABLE ONLY public.prediction_results ALTER COLUMN id_result SET DEFAULT nextval('public.resultados_predicciones_id_resultados_seq'::regclass);
 K   ALTER TABLE public.prediction_results ALTER COLUMN id_result DROP DEFAULT;
       public          postgres    false    220    219    220            n           2604    16403    team id_team    DEFAULT     q   ALTER TABLE ONLY public.team ALTER COLUMN id_team SET DEFAULT nextval('public.equipos_id_equipo_seq'::regclass);
 ;   ALTER TABLE public.team ALTER COLUMN id_team DROP DEFAULT;
       public          postgres    false    215    216    216            s           2604    16457    tokens id_tokens    DEFAULT     t   ALTER TABLE ONLY public.tokens ALTER COLUMN id_tokens SET DEFAULT nextval('public.tokens_id_tokens_seq'::regclass);
 ?   ALTER TABLE public.tokens ALTER COLUMN id_tokens DROP DEFAULT;
       public          postgres    false    226    225    226            r           2604    16448    user id_user    DEFAULT     t   ALTER TABLE ONLY public."user" ALTER COLUMN id_user SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 =   ALTER TABLE public."user" ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    223    224    224            t           2604    16469    user_player id_user_player    DEFAULT     �   ALTER TABLE ONLY public.user_player ALTER COLUMN id_user_player SET DEFAULT nextval('public.usuariosxjugadores_id_usuariosxjugadores_seq'::regclass);
 I   ALTER TABLE public.user_player ALTER COLUMN id_user_player DROP DEFAULT;
       public          postgres    false    228    227    228                      0    16407    player 
   TABLE DATA           �   COPY public.player (id_player, name, foot, team, short_name_position, age, " shirt_number", market_value_mister_fantasy, nationality, image_url, team_id) FROM stdin;
    public          postgres    false    218   uL                 0    16433    player_statistics 
   TABLE DATA           �  COPY public.player_statistics (id_player_statistics, player_id, fluctuation_value, average, score_player, points_antepenultimate_match, game_played, minutes_played, goals, assists, assists_without_goal, balls_into_area, clearances, dribbles, kicks_to_goal, recovered_balls, possession_loss, penaltis_failed, goals_against, red_cards, ball_stop, penalties_made, yellow_cards, second_yellow_card_match, penalties_caused, penalties_stopped, own_goals) FROM stdin;
    public          postgres    false    222   �L                 0    16421    prediction_results 
   TABLE DATA           �   COPY public.prediction_results (id_result, player_id, old_score, predicted_score, old_price, predicted_price, prediction_date) FROM stdin;
    public          postgres    false    220   �L                 0    16400    team 
   TABLE DATA           -   COPY public.team (id_team, name) FROM stdin;
    public          postgres    false    216   �L       #          0    16454    tokens 
   TABLE DATA           L   COPY public.tokens (id_tokens, user_id, token, date_expiration) FROM stdin;
    public          postgres    false    226   �L       !          0    16445    user 
   TABLE DATA           I   COPY public."user" (id_user, email, password, creation_date) FROM stdin;
    public          postgres    false    224   M       %          0    16466    user_player 
   TABLE DATA           O   COPY public.user_player (id_user_player, user_id, player_id, date) FROM stdin;
    public          postgres    false    228   #M       3           0    0    equipos_id_equipo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.equipos_id_equipo_seq', 1, false);
          public          postgres    false    215            4           0    0 .   estadisticasjugador_id_estadisticasjugador_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.estadisticasjugador_id_estadisticasjugador_seq', 1, false);
          public          postgres    false    221            5           0    0    jugador_id_jugador_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.jugador_id_jugador_seq', 1, false);
          public          postgres    false    217            6           0    0 )   resultados_predicciones_id_resultados_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.resultados_predicciones_id_resultados_seq', 1, false);
          public          postgres    false    219            7           0    0    tokens_id_tokens_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tokens_id_tokens_seq', 1, false);
          public          postgres    false    225            8           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, false);
          public          postgres    false    223            9           0    0 ,   usuariosxjugadores_id_usuariosxjugadores_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.usuariosxjugadores_id_usuariosxjugadores_seq', 1, false);
          public          postgres    false    227            v           2606    16405    team equipos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.team
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (id_team);
 ;   ALTER TABLE ONLY public.team DROP CONSTRAINT equipos_pkey;
       public            postgres    false    216            |           2606    16438 *   player_statistics estadisticasjugador_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.player_statistics
    ADD CONSTRAINT estadisticasjugador_pkey PRIMARY KEY (id_player_statistics);
 T   ALTER TABLE ONLY public.player_statistics DROP CONSTRAINT estadisticasjugador_pkey;
       public            postgres    false    222            x           2606    16414    player jugador_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.player
    ADD CONSTRAINT jugador_pkey PRIMARY KEY (id_player);
 =   ALTER TABLE ONLY public.player DROP CONSTRAINT jugador_pkey;
       public            postgres    false    218            z           2606    16426 /   prediction_results resultados_predicciones_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.prediction_results
    ADD CONSTRAINT resultados_predicciones_pkey PRIMARY KEY (id_result);
 Y   ALTER TABLE ONLY public.prediction_results DROP CONSTRAINT resultados_predicciones_pkey;
       public            postgres    false    220            �           2606    16459    tokens tokens_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id_tokens);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    226            ~           2606    16452    user usuario_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_user);
 =   ALTER TABLE ONLY public."user" DROP CONSTRAINT usuario_pkey;
       public            postgres    false    224            �           2606    16471 #   user_player usuariosxjugadores_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.user_player
    ADD CONSTRAINT usuariosxjugadores_pkey PRIMARY KEY (id_user_player);
 M   ALTER TABLE ONLY public.user_player DROP CONSTRAINT usuariosxjugadores_pkey;
       public            postgres    false    228            �           2606    16439 5   player_statistics estadisticasjugador_id_jugador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player_statistics
    ADD CONSTRAINT estadisticasjugador_id_jugador_fkey FOREIGN KEY (player_id) REFERENCES public.player(id_player);
 _   ALTER TABLE ONLY public.player_statistics DROP CONSTRAINT estadisticasjugador_id_jugador_fkey;
       public          postgres    false    218    222    4728            �           2606    16415    player jugador_equipo_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player
    ADD CONSTRAINT jugador_equipo_id_fkey FOREIGN KEY (team_id) REFERENCES public.team(id_team);
 G   ALTER TABLE ONLY public.player DROP CONSTRAINT jugador_equipo_id_fkey;
       public          postgres    false    218    4726    216            �           2606    16427 :   prediction_results resultados_predicciones_id_jugador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prediction_results
    ADD CONSTRAINT resultados_predicciones_id_jugador_fkey FOREIGN KEY (player_id) REFERENCES public.player(id_player);
 d   ALTER TABLE ONLY public.prediction_results DROP CONSTRAINT resultados_predicciones_id_jugador_fkey;
       public          postgres    false    4728    218    220            �           2606    16460    tokens tokens_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_id_usuario_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id_user);
 G   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_id_usuario_fkey;
       public          postgres    false    224    4734    226            �           2606    16477 .   user_player usuariosxjugadores_id_jugador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_player
    ADD CONSTRAINT usuariosxjugadores_id_jugador_fkey FOREIGN KEY (player_id) REFERENCES public.player(id_player);
 X   ALTER TABLE ONLY public.user_player DROP CONSTRAINT usuariosxjugadores_id_jugador_fkey;
       public          postgres    false    4728    228    218            �           2606    16472 .   user_player usuariosxjugadores_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_player
    ADD CONSTRAINT usuariosxjugadores_id_usuario_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id_user);
 X   ALTER TABLE ONLY public.user_player DROP CONSTRAINT usuariosxjugadores_id_usuario_fkey;
       public          postgres    false    224    4734    228                  x������ � �            x������ � �            x������ � �            x������ � �      #      x������ � �      !      x������ � �      %      x������ � �     